//=============================================
//
//3DTemplate[character.h]
//Auther Matsuda Towa
//
//=============================================
#ifndef _CHARACTER_H_ //これが定義されてないとき

#define _CHARACTER_H_
#include "main.h"
#include "objectX.h"
#include "model_parts.h"

//プレイヤークラス
class CCharacter : public CObjectX
{
public:
	static const int MAX_KEY = 20; //キー最大数
	static const int MAX_MOTION = 5;
	static const int CHARACTER_PRIORITY = 8; //描画順
	static const int MAX_PARTS = 12; //最大パーツ数
	static const float  BOSS_FIELD_X; //ボス戦のX座標

	typedef enum
	{
		CHARACTER_NORMAL = 0, //通常状態
		CHARACTER_DAMAGE, //ダメージ状態
		CHARACTER_STATE_MAX,
	}CHARACTER_STATE;

	CCharacter(int nPriority = CHARACTER_PRIORITY);
	~CCharacter()override;
	HRESULT Init()override;
	void Uninit()override;
	void Update()override;
	void Draw()override;
	void MotionDraw(int NumParts);

	void Load_Parts(const char* FileName, int NumParts);
	void Motion(int NumParts); //モーション処理
	void SetMotion(int Motion, int NumParts); //引数で指定したモーションに切り替える
	void Gravity(); //重力処理
	void HitBlock(); //ブロック当たり判定
	void HitField(); //床当たり判定

	//移動量代入
	void SetMove(D3DXVECTOR3 move)
	{
		m_move = move;
	}

	//oldpos代入
	void SetOldPos(D3DXVECTOR3 oldpos)
	{
		m_oldpos = oldpos;
	}

	//着地してるかどうかを代入
	void SetLanding(bool bLanding)
	{
		m_bLanding = bLanding;
	}

	//どっち向いてるかどうかを代入(true:右false:左)
	void SetWay(bool bWay)
	{
		m_bWay = bWay;
	}

	//体力代入
	void SetLife(int nLife)
	{
		m_nLife = nLife;
	}

	//状態代入
	void SetState(CHARACTER_STATE state)
	{
		m_State = state;
	}

	//ステートカウント代入
	void SetStateCnt(int nStateCnt)
	{
		m_nStateCnt = nStateCnt;
	}

	//パーツ数代入
	void SetNumParts(int nNumParts)
	{
		m_PartsCnt = nNumParts;
	}

	//終わった判定に
	void SetFinish(bool bFinish)
	{
		m_bLoopFinish = bFinish;
	}

	//移動量取得
	D3DXVECTOR3& GetMove();

	//過去の位置取得
	D3DXVECTOR3& GetOldPos();

	//着地してるかどうか取得
	bool& GetLaunding();

	//どっち向いてるかどうかを取得(true:右false:左)
	bool& GetWay();

	//終わってるか取得
	bool& GetFinish();

	//体力取得
	int& GetLife();

	//状態取得
	CHARACTER_STATE& GetState();

	//ステートカウント取得
	int& GetStateCnt();

private:
	static const float GRAVITY_MOVE; //重力値
	static const float GRAVITY_MAX; //重力最大値

	D3DXVECTOR3 m_move; //速度
	D3DXVECTOR3 m_oldpos; //過去の位置
	bool m_bLanding; //着地してるかどうか
	bool m_bWay; //どっち向いてるか(true:右false:左)
	bool m_bLoopFinish; //ループモーションが終わったか
	int m_nLife; //体力
	int m_nStateCnt; //ステート切り替え計測カウント
	int m_PartsCnt; //パーツ数
	int m_nMotionFrameCnt; //切り替えフレームカウント
	int m_nKeySetCnt; //キー切り替えカウント
	int m_Motion; //モーション(各オブジェクトから列挙を受け取る)
	CModel_Parts* m_apModel[MAX_PARTS];
	CHARACTER_STATE m_State; //プレイヤー状態
	D3DXCOLOR m_col; //カラー

	//キー情報構造体
	typedef struct
	{
		D3DXVECTOR3 pos;
		D3DXVECTOR3 rot;

		D3DXVECTOR3 Trot;
	}Key;

	//キー設定構造体
	typedef struct
	{
		int nFrame; //フレーム数
		Key key[MAX_KEY];
	}KeySet;

	//モーション設定構造体
	typedef struct
	{
		int nLoop; //ループするかどうか
		int nNumKey; //キー数
		KeySet keySet[MAX_PARTS];
	}MotionSet;

	MotionSet m_MotionSet[MAX_MOTION]; //モーション設定
};
#endif