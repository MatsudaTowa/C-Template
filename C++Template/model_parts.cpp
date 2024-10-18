//=============================================
// 
//親子関係のパーツ[model.h]
//Auther Matsuda Towa
//
//=============================================
#include "model_parts.h"
#include "manager.h"

//=============================================
//コンストラクタ
//=============================================
CModel_Parts::CModel_Parts()
{
}

//=============================================
//デストラクタ
//=============================================
CModel_Parts::~CModel_Parts()
{
}

//=============================================
//削除
//=============================================
void CModel_Parts::Unload()
{
	for (int nCnt = 0; nCnt < MAX_MODEL; nCnt++)
	{
		if (m_ModelInfo[nCnt].pBuffMat != nullptr)
		{//マテリアル破棄
			m_ModelInfo[nCnt].pBuffMat->Release();
			m_ModelInfo[nCnt].pBuffMat = nullptr;
			m_ModelInfo[nCnt].dwNumMat = 0;
		}
		if (m_ModelInfo[nCnt].pMesh != nullptr)
		{//メッシュ破棄
			m_ModelInfo[nCnt].pMesh->Release();
			m_ModelInfo[nCnt].pMesh = nullptr;
		}

		if (m_ModelInfo[nCnt].ModelName != nullptr)
		{//モデルネーム破棄
			m_ModelInfo[nCnt].ModelName = nullptr;
		}
	}
	m_nNumAll = 0;
}

//=============================================
//xファイル読み込み
//=============================================
void CModel_Parts::BindXFile(LPD3DXBUFFER pBuffMat, DWORD dwNumMat, LPD3DXMESH pMesh)
{

	pBuffMat->AddRef();
	pMesh->AddRef();

	m_ModelInfo->pBuffMat = pBuffMat;
	m_ModelInfo->dwNumMat = dwNumMat;
	m_ModelInfo->pMesh = pMesh;

	int nNumVtx; //頂点数
	DWORD sizeFVF; //頂点フォーマットのサイズ
	BYTE* pVtxBuff; //頂点バッファのポインタ

		//頂点数の取得
	nNumVtx = m_ModelInfo->pMesh->GetNumVertices();
	//頂点フォーマットのサイズを取得
	sizeFVF = D3DXGetFVFVertexSize(m_ModelInfo->pMesh->GetFVF());

	m_minpos = D3DXVECTOR3(100000.0f, 1000000.0f, 1000000.0f); //モデルの最小位置
	m_maxpos = D3DXVECTOR3(-100000.0f, -1000000.0f, -100000.0f); //モデルの最大位置

	//頂点バッファのロック
	m_ModelInfo->pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVtxBuff);
	for (int nCntVtx = 0; nCntVtx < nNumVtx; nCntVtx++)
	{
		//頂点座標の代入
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVtxBuff;

		//x座標の最大値最小値チェック
		if (vtx.x > m_maxpos.x)
		{
			m_maxpos.x = vtx.x;
		}
		if (vtx.x < m_minpos.x)
		{
			m_minpos.x = vtx.x;
		}

		//y座標の最大値最小値チェック
		if (vtx.y > m_maxpos.y)
		{
			m_maxpos.y = vtx.y;
		}
		if (vtx.y < m_minpos.y)
		{
			m_minpos.y = vtx.y;
		}

		//z座標の最大値最小値チェック
		if (vtx.z > m_maxpos.z)
		{
			m_maxpos.z = vtx.z;
		}
		if (vtx.z < m_minpos.z)
		{
			m_minpos.z = vtx.z;
		}

		// 次の頂点に進む
		pVtxBuff += sizeFVF;
	}

	m_ModelInfo->pMesh->UnlockVertexBuffer();
}

//=============================================
//モデル登録
//=============================================
int CModel_Parts::Regist(char* pModel)
{
	int nIdx = 0;
	for (int nCnt = 0; nCnt < MAX_MODEL; nCnt++)
	{
		if (m_ModelInfo[nCnt].pBuffMat == nullptr
			&& m_ModelInfo[nCnt].pMesh == nullptr)
		{
			LPDIRECT3DDEVICE9 pDevice = CManager::GetRenderer()->GetDevice();

			//Xファイルの読み込み
			D3DXLoadMeshFromX(pModel,
				D3DXMESH_SYSTEMMEM,
				pDevice,
				NULL,
				&m_ModelInfo[nCnt].pBuffMat,
				NULL,
				&m_ModelInfo[nCnt].dwNumMat,
				&m_ModelInfo[nCnt].pMesh);

			//引数のファイルパスを保存
			m_ModelInfo[nCnt].ModelName = pModel;
			nIdx = nCnt;	//番号の保存
			m_nNumAll++;	//総数のカウントアップ
			break;
		}
		else if (m_ModelInfo[nCnt].ModelName == pModel)
		{//引数のモデルが存在するなら

			//番号を代入してbreak
			nIdx = nCnt;
			break;
		}
	}
	return nIdx;
}

//=============================================
//生成
//=============================================
CModel_Parts* CModel_Parts::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot,char* pModel)
{
	CModel_Parts*pModelParts = new CModel_Parts;

	if (pModelParts == nullptr)
	{
		return nullptr;
	}

	pModelParts->m_pos = pos; //頂点代入
	pModelParts->m_rot = rot; //頂点代入

	//Xファイル読み込み
	pModelParts->BindXFile(pModelParts->GetModelInfo(pModelParts->Regist(pModel)).pBuffMat, //マテリアル取得
		pModelParts->GetModelInfo(pModelParts->Regist(pModel)).dwNumMat, //マテリアル数取得
		pModelParts->GetModelInfo(pModelParts->Regist(pModel)).pMesh); //メッシュ情報取得

	return pModelParts;
}

//=============================================
//親パーツの設定
//=============================================
void CModel_Parts::SetParent(CModel_Parts* pParent)
{
	m_pParent = pParent;
}

D3DXMATRIX& CModel_Parts::GetMtxWorld()
{
	return m_mtxWorld;
}

CModel_Parts::MODEL_INFO CModel_Parts::GetModelInfo(int nIdx)
{
	return m_ModelInfo[nIdx];
}

