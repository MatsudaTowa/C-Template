//=============================================
//
//3DTemplate[player.cpp]
//Auther Matsuda Towa
//
//=============================================
#include "player_test.h"
#include "manager.h"
#include "input.h"
#include "block.h"
#include "field.h"
#include "camera.h"
#include "game.h"

//通常の移動速度
const float CPlayer_test::DEFAULT_MOVE = 1.0f;
//通常の移動速度
const float CPlayer_test::DAMPING_COEFFICIENT = 0.3f;

//通常のジャンプ力
const float CPlayer_test::DEFAULT_JUMP = 25.0f;

//ジャンプ回数
const int CPlayer_test::MAX_JUMPCNT = 2;

//プレイヤーをリスポーンされる座標
const float CPlayer_test::DEADZONE_Y = -100.0f;

//テクスチャ初期化
LPDIRECT3DTEXTURE9 CPlayer_test::m_pTextureTemp = nullptr;

LPD3DXBUFFER CPlayer_test::m_pBuffMat = nullptr;

LPD3DXMESH CPlayer_test::m_pMesh = nullptr;

DWORD CPlayer_test::m_dwNumMat = 0;

//=============================================
//コンストラクタ
//=============================================
CPlayer_test::CPlayer_test(int nPriority) :CCharacter(nPriority), m_nJumpCnt(0), m_PartsCnt(0),m_apModel(),m_MotionSet()
, m_Motion(), m_nMotionFrameCnt(), m_nKeySetCnt()
{//イニシャライザーでメンバ変数初期化

}

//=============================================
//デストラクタ
//=============================================
CPlayer_test::~CPlayer_test()
{
}

//=============================================
//初期化
//=============================================
HRESULT CPlayer_test::Init()
{
	CRenderer* pRender = CManager::GetRenderer();
	LPDIRECT3DDEVICE9 pDevice = pRender->GetDevice();

	//移動量初期化
	D3DXVECTOR3 move = D3DXVECTOR3(0.0f, 0.0f, 0.0f);

	m_Motion = CPlayer_test::Motion_Type::MOTION_MAX; //ニュートラルに設定

	for (int nCnt = 0; nCnt < NUM_PARTS; nCnt++)
	{
		CModel* pModel = CManager::GetModel();
	}

	//ムーブ値代入
	SetMove(move);

	return S_OK;
}

//=============================================
//終了
//=============================================
void CPlayer_test::Uninit()
{
	//親クラスの終了処理を呼ぶ
	CObjectX::Uninit();

}

//=============================================
//更新
//=============================================
void CPlayer_test::Update()
{
	//現在のシーンを取得
	CScene::MODE pScene = CScene::GetSceneMode();

	if (pScene != CScene::MODE::MODE_TITLE)
	{
		//状態を取得
		CCharacter::CHARACTER_STATE state = GetState();

		if (state == CCharacter::CHARACTER_STATE::CHARACTER_DAMAGE)
		{
			//状態のカウント数取得
			int nStateCnt = GetStateCnt();

			//ステート変更カウント進める
			nStateCnt++;

			//ステートカウント代入
			SetStateCnt(nStateCnt);
		}

		//重力処理
		Gravity();

		//移動処理
		PlayerMove();

		//位置取得
		D3DXVECTOR3 pos = GetPos();

		//過去の位置
		D3DXVECTOR3 oldpos = GetOldPos();

		//移動量取得
		D3DXVECTOR3 move = GetMove();

		//移動量を更新(減速）
		move *= 1.0f - DAMPING_COEFFICIENT;

		//移動量代入
		SetMove(move);

		//過去の位置に今の位置を代入
		oldpos = pos;

		//過去の位置代入
		SetOldPos(oldpos);

		//移動量追加
		pos += move;

		//座標を更新
		SetPos(pos);

		//最大最小値取得
		D3DXVECTOR3 minpos = GetMinPos();
		D3DXVECTOR3 maxpos = GetMaxPos();

		//ブロックとの接触処理
		HitBlock();

		//床との接触処理
		HitField();

		//ゲームの状態取得
		CGame::GAME_STATE Game_state = CGame::GetState();

		if (GetLaunding())
		{//着地してるなら
			//ジャンプ数リセット
			m_nJumpCnt = 0;
		}

		if (pos.y < DEADZONE_Y)
		{//リスポーン処理
			ReSpawn();
		}

		//マウスの情報取得
		CInputMouse* pMouse = CManager::GetMouse();
		CInputPad* pPad = CManager::GetPad();

		//どっち向いてるか取得
		bool bWay = GetWay();

		Motion(); //モーション処理
	}
}

//=============================================
//描画
//=============================================
void CPlayer_test::Draw()
{
	//デバイスの取得
	CRenderer* pRender = CManager::GetRenderer();
	LPDIRECT3DDEVICE9 pDevice = pRender->GetDevice();
	D3DMATERIAL9 matDef; //現在のマテリアルの保存
	D3DXMATRIX mtxRot, mtxTrans; //計算用マトリックス
	D3DXMATRIX MtxWorld = GetMtxWorld();

	//マトリックスの初期化
	D3DXMatrixIdentity(&MtxWorld);

	//αテストを有効
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);

	//向きを反映
	D3DXMatrixRotationYawPitchRoll(&mtxRot, GetRot().y, GetRot().x, GetRot().z);

	D3DXMatrixMultiply(&MtxWorld, &MtxWorld, &mtxRot);

	//位置を反映
	D3DXMatrixTranslation(&mtxTrans, GetPos().x, GetPos().y, GetPos().z);

	D3DXMatrixMultiply(&MtxWorld, &MtxWorld, &mtxTrans);

	//ワールドマトリックスの設定
	pDevice->SetTransform(D3DTS_WORLD, &MtxWorld);

	for (int nCnt = 0; nCnt < CPlayer_test::PLAYER_PARTS; nCnt++)
	{
		m_apModel[nCnt]->Draw();
	}

	DebugPos();
}

//=============================================
//生成
//=============================================
CPlayer_test* CPlayer_test::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot, int nLife)
{
	CModel* pModel = CManager::GetModel();

	CPlayer_test* pPlayer = new CPlayer_test;

	// nullならnullを返す
	if (pPlayer == nullptr) { return nullptr; }

	pPlayer->SetPos(pos); //pos設定
	pPlayer->SetRot(rot); //rot設定
	pPlayer->SetLife(nLife); //体力代入

	pPlayer->Init(); //初期化処理

	pPlayer->LoadPlayer_Parts();

	pPlayer->SetType(OBJECT_TYPE_NONE); //タイプ設定

	return pPlayer;
}

//=============================================
//ダメージを受けたとき
//=============================================
void CPlayer_test::Damage(int nDamage)
{
	//体力取得
	int nLife = GetLife();

	if (nLife > 0)
	{//HPが残ってたら
		nLife -= nDamage;

		//体力代入
		SetLife(nLife);
	}
	if (nLife <= 0)
	{//HPが0以下だったら
		//終了
		Uninit();
	}
}

//=============================================
//リスポーン
//=============================================
void CPlayer_test::ReSpawn()
{
	//自分自身のpos取得
	D3DXVECTOR3 PlayerPos = GetPos();

	PlayerPos = D3DXVECTOR3(-450.0f, 0.5f, 0.0f);

	//pos代入
	SetPos(PlayerPos);
}

//=============================================
//移動処理
//=============================================
void CPlayer_test::PlayerMove()
{
	CInputKeyboard* pKeyboard = CManager::GetKeyboard();
	D3DXVECTOR3 vecDirection(0.0f, 0.0f, 0.0f);

	//カメラタイプ取得
	CCamera::CANERA_TYPE pCameraType = CCamera::GetType();

	//どっち向いてるか取得
	bool bWay = GetWay();

	switch (pCameraType)
	{//サイドビューの時は横にしか動かないように設定
	case CCamera::CANERA_TYPE::TYPE_SIDEVIEW:
		if (pKeyboard->GetPress(DIK_A))
		{
			vecDirection.x -= 1.0f;
			bWay = false;
		}
		else if (pKeyboard->GetPress(DIK_D))
		{
			vecDirection.x += 1.0f;
			bWay = true;
		}
		break;
	case CCamera::CANERA_TYPE::TYPE_PARALLEL_SIDEVIEW:
		if (pKeyboard->GetPress(DIK_A))
		{
			vecDirection.x -= 1.0f;
			bWay = false;
		}
		else if (pKeyboard->GetPress(DIK_D))
		{
			vecDirection.x += 1.0f;
			bWay = true;
		}
		break;
	default:
		if (pKeyboard->GetPress(DIK_W))
		{
			vecDirection.z += 1.0f;
		}
		if (pKeyboard->GetPress(DIK_S))
		{
			vecDirection.z -= 1.0f;
		}
		if (pKeyboard->GetPress(DIK_A))
		{
			vecDirection.x -= 1.0f;
			bWay = false;
		}
		else if (pKeyboard->GetPress(DIK_D))
		{
			vecDirection.x += 1.0f;
			bWay = true;
		}
		break;
	}

	//どっち向いてるか代入
	SetWay(bWay);

	//移動量取得
	D3DXVECTOR3 move = GetMove();

	//着地してるか取得
	bool bLanding = GetLaunding();

	if (vecDirection.x == 0.0f && vecDirection.z == 0.0f)
	{ // 動いてない。
		move.x = 0.0f;
		move.z = 0.0f;
		SetMotion(MOTION_NEUTRAL); //現在のモーションを設定
	}
	else
	{
		float rotMoveY = atan2f(vecDirection.x, vecDirection.z);

		//オブジェクト2Dからrotを取得
		D3DXVECTOR3 rot = GetRot();

		move.x += sinf(rotMoveY) * DEFAULT_MOVE;
		move.z += cosf(rotMoveY) * DEFAULT_MOVE;
		rot.y = rotMoveY + D3DX_PI;
		//rotを代入
		SetRot(rot);
		SetMotion(MOTION_MOVE); //現在のモーションを設定
	}
	if (m_nJumpCnt < MAX_JUMPCNT)
	{//ジャンプ数以下だったら
		if (pKeyboard->GetTrigger(DIK_SPACE))
		{
			move.y = DEFAULT_JUMP;
			bLanding = false; //空中
			m_nJumpCnt++; //ジャンプ数加算
		}
	}

	//移動量代入
	SetMove(move);

	//着地してるか代入
	SetLanding(bLanding);

}

//=============================================
//ファイル読み込み
//=============================================
void CPlayer_test::LoadPlayer_Parts()
{
	int nCnt = 0;
	int nCntName = 0;
	int nCntKey = 0; //キーを入れるパーツのカウント数
	int nCntMotion = 0; //キー数のカウント
	int nCntMotionSet = 0; //モーションの種類のカウント
	char aDataSearch[256];
	char aEqual[256]; //[＝]読み込み用
	char aGets[256]; //モーションのいらないもの読み込み用
	float speed = 0.0f;//移動量
	float jump = 0.0f;//ジャンプ力
	float radius = 0.0f;//半径
	float height = 0.0f;//高さ

	char Path[256][NUM_PARTS]; //パーツのパス

	//ファイルの読み込み
	FILE* pFile = fopen("data\\Motion.txt", "r");

	if (pFile == NULL)
	{//種類の情報のデータファイルが開けなかった場合
		//処理を終了する
		return;
	}

	//ENDが見つかるまで読み込みを繰り返す
	while (1)
	{
		fscanf(pFile, "%s", aDataSearch); //検索

		if (!strcmp(aDataSearch, "END"))
		{//読み込みを終了
			fclose(pFile);
			break;
		}
		if (aDataSearch[0] == '#')
		{
			continue;
		}

		if (!strcmp(aDataSearch, "NUM_MODEL"))
		{//モデル数読み込み
			fscanf(pFile, "%s", &aEqual[0]);
			fscanf(pFile, "%d", &m_PartsCnt);
		}
		if (!strcmp(aDataSearch, "MODEL_FILENAME"))
		{//モデルファイル読み込み
			fscanf(pFile, "%s", &aEqual[0]);
			fscanf(pFile, "%s", &Path[0][nCntName]);
			m_apModel[nCntName] = CModel_Parts::Create(D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXVECTOR3(0.0f, 0.0f, 0.0f), &Path[0][nCntName]);

			nCntName++;
		}

		if (!strcmp(aDataSearch, "CHARACTERSET"))
		{
			//項目ごとのデータを代入
			while (1)
			{
				fscanf(pFile, "%s", aDataSearch); //検索

				if (!strcmp(aDataSearch, "END_CHARACTERSET"))
				{
					break;
				}
				else if (!strcmp(aDataSearch, "MOVE"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%f", &speed);
				}
				else if (!strcmp(aDataSearch, "JUMP"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%f", &jump);
				}
				else if (!strcmp(aDataSearch, "RADIUS"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%f", &radius);
				}
				else if (!strcmp(aDataSearch, "HEIGHT"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%f", &height);
				}
				else if (!strcmp(aDataSearch, "PARTSSET"))
				{
					//項目ごとのデータを代入
					while (1)
					{
						fscanf(pFile, "%s", aDataSearch); //検索

						if (!strcmp(aDataSearch, "END_PARTSSET"))
						{
							break;
						}
						else if (!strcmp(aDataSearch, "INDEX"))
						{
							fscanf(pFile, "%s", &aEqual[0]);
							fscanf(pFile, "%d", &m_apModel[nCnt]->m_nIdx);
						}
						else if (!strcmp(aDataSearch, "PARENT"))
						{
							fscanf(pFile, "%s", &aEqual[0]);
							fscanf(pFile, "%d", &m_apModel[nCnt]->m_nIdxModelParent);

							//あ
							if (m_apModel[nCnt]->m_nIdxModelParent == -1)
							{
								m_apModel[nCnt]->SetParent(nullptr);
							}
							else
							{
								m_apModel[nCnt]->SetParent(m_apModel[m_apModel[nCnt]->m_nIdxModelParent]);
							}
							
						}
						else if (!strcmp(aDataSearch, "POS"))
						{
							fscanf(pFile, "%s", &aEqual[0]);
							fscanf(pFile, "%f %f %f",
								&m_apModel[nCnt]->m_pos.x,
								&m_apModel[nCnt]->m_pos.y,
								&m_apModel[nCnt]->m_pos.z);
						}
						else if (!strcmp(aDataSearch, "ROT"))
						{
							fscanf(pFile, "%s", &aEqual[0]);
							fscanf(pFile, "%f %f %f",
								&m_apModel[nCnt]->m_rot.x,
								&m_apModel[nCnt]->m_rot.y,
								&m_apModel[nCnt]->m_rot.z);
						}
					}
					nCnt++; //データ数加算
				}
			}
		}
		if (!strcmp(aDataSearch, "MOTIONSET"))
		{
			//項目ごとのデータを代入
			while (1)
			{
				fscanf(pFile, "%s", aDataSearch); //検索

				if (!strcmp(aDataSearch, "END_MOTIONSET"))
				{
					nCntMotion = 0;
					break;
				}
				else if (!strcmp(aDataSearch, "LOOP"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%d", &m_MotionSet[nCntMotionSet].nLoop);
				}
				else if (!strcmp(aDataSearch, "NUM_KEY"))
				{
					fscanf(pFile, "%s", &aEqual[0]);
					fscanf(pFile, "%d", &m_MotionSet[nCntMotionSet].nNumKey);

				}
				else if (!strcmp(aDataSearch, "KEYSET"))
				{
					fgets(&aGets[0], 39, pFile);

					//項目ごとのデータを代入
					while (1)
					{
						fscanf(pFile, "%s", aDataSearch); //検索

						if (!strcmp(aDataSearch, "END_KEYSET"))
						{
							nCntKey = 0;
							break;
						}

						else if (!strcmp(aDataSearch, "FRAME"))
						{
							fscanf(pFile, "%s", &aEqual[0]);
							fscanf(pFile, "%d", &m_MotionSet[nCntMotionSet].keySet[nCntMotion].nFrame);
						}
						else if (!strcmp(aDataSearch, "KEY"))
						{
							//項目ごとのデータを代入
							while (1)
							{
								fscanf(pFile, "%s", aDataSearch);

								if (!strcmp(aDataSearch, "END_KEY"))
								{
									break;
								}
								else if (!strcmp(aDataSearch, "POS"))
								{
									fscanf(pFile, "%s", &aEqual[0]);
									fscanf(pFile, "%f %f %f", &m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].pos.x,
										&m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].pos.y,
										&m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].pos.z);
								}
								else if (!strcmp(aDataSearch, "ROT"))
								{
									fscanf(pFile, "%s", &aEqual[0]);
									fscanf(pFile, "%f %f %f", &m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].rot.x,
										&m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].rot.y,
										&m_MotionSet[nCntMotionSet].keySet[nCntMotion].key[nCntKey].rot.z);
								}
							}
							nCntKey++; //パーツ数加算
						}
					}
					nCntMotion++; //キー数加算
				}
			}
			nCntMotionSet++; //キータイプ数加算
		}
	}
}

//=====================================
//モーション処理
//=====================================
void CPlayer_test::Motion(void)
{
	D3DXVECTOR3 MovePos[NUM_PARTS];
	D3DXVECTOR3 MoveRot[NUM_PARTS];

	int nNextKey = (m_nKeySetCnt + 1) % m_MotionSet[m_Motion].nNumKey;

	for (int nMotionCnt = 0; nMotionCnt < NUM_PARTS; nMotionCnt++)
	{
		MovePos[nMotionCnt] = (m_MotionSet[m_Motion].keySet[nNextKey].key[nMotionCnt].pos - m_MotionSet[m_Motion].keySet[m_nKeySetCnt].key[nMotionCnt].pos) / (float)m_MotionSet[m_Motion].keySet[m_nKeySetCnt].nFrame;
		MoveRot[nMotionCnt] = (m_MotionSet[m_Motion].keySet[nNextKey].key[nMotionCnt].rot - m_MotionSet[m_Motion].keySet[m_nKeySetCnt].key[nMotionCnt].rot) / (float)m_MotionSet[m_Motion].keySet[m_nKeySetCnt].nFrame;

		//m_apModel[nMotionCnt]->m_pos += MovePos[nMotionCnt];
		m_apModel[nMotionCnt]->m_rot += MoveRot[nMotionCnt];
	}

	m_nMotionFrameCnt++;

	if (m_nMotionFrameCnt > m_MotionSet[m_Motion].keySet[m_nKeySetCnt].nFrame)
	{
		m_nMotionFrameCnt = 0;
		m_nKeySetCnt = (m_nKeySetCnt + 1) % m_MotionSet[m_Motion].nNumKey;
	}
}

//=====================================
//引数で指定したモーションに切り替える
//=====================================
void CPlayer_test::SetMotion(Motion_Type Motion)
{
	if (m_Motion != Motion)
	{
		m_Motion = Motion;

		//フレームリセット
		m_nMotionFrameCnt = 0;

		//キーカウントリセット
		m_nKeySetCnt = 0;

		for (int nCntParts = 0; nCntParts < NUM_PARTS; nCntParts++)
		{
			//m_apModel[nCntParts]->m_pos = m_MotionSet[Motion].keySet[0].key[nCntParts].pos;
			m_apModel[nCntParts]->m_rot = m_MotionSet[Motion].keySet[0].key[nCntParts].rot;
		}
	}
}

//=============================================
//プレイヤーのデバッグ表示
//=============================================
void CPlayer_test::DebugPos()
{
	LPD3DXFONT pFont = CManager::GetRenderer()->GetFont();
	RECT rect = { 0,0,SCREEN_WIDTH,SCREEN_HEIGHT };
	char aStr[256];

	sprintf(&aStr[0], "\n\n[player]\npos:%.1f,%.1f,%.1f\nrot:%.1f,%.1f,%.1f"
		, GetPos().x, GetPos().y, GetPos().z, GetRot().x, GetRot().y, GetRot().z);
	//テキストの描画
	pFont->DrawText(NULL, &aStr[0], -1, &rect, DT_LEFT, D3DCOLOR_RGBA(255, 255, 255, 255));
}
