//=============================================
// 
//�e�q�֌W�̃p�[�c[model.h]
//Auther Matsuda Towa
//
//=============================================
#include "model_parts.h"
#include "manager.h"

//=============================================
//�R���X�g���N�^
//=============================================
CModel_Parts::CModel_Parts()
{
}

//=============================================
//�f�X�g���N�^
//=============================================
CModel_Parts::~CModel_Parts()
{
}

//=============================================
//�폜
//=============================================
void CModel_Parts::Unload()
{
	for (int nCnt = 0; nCnt < MAX_MODEL; nCnt++)
	{
		if (m_ModelInfo[nCnt].pBuffMat != nullptr)
		{//�}�e���A���j��
			m_ModelInfo[nCnt].pBuffMat->Release();
			m_ModelInfo[nCnt].pBuffMat = nullptr;
			m_ModelInfo[nCnt].dwNumMat = 0;
		}
		if (m_ModelInfo[nCnt].pMesh != nullptr)
		{//���b�V���j��
			m_ModelInfo[nCnt].pMesh->Release();
			m_ModelInfo[nCnt].pMesh = nullptr;
		}

		if (m_ModelInfo[nCnt].ModelName != nullptr)
		{//���f���l�[���j��
			m_ModelInfo[nCnt].ModelName = nullptr;
		}
	}
	m_nNumAll = 0;
}

//=============================================
//x�t�@�C���ǂݍ���
//=============================================
void CModel_Parts::BindXFile(LPD3DXBUFFER pBuffMat, DWORD dwNumMat, LPD3DXMESH pMesh)
{

	pBuffMat->AddRef();
	pMesh->AddRef();

	m_ModelInfo->pBuffMat = pBuffMat;
	m_ModelInfo->dwNumMat = dwNumMat;
	m_ModelInfo->pMesh = pMesh;

	int nNumVtx; //���_��
	DWORD sizeFVF; //���_�t�H�[�}�b�g�̃T�C�Y
	BYTE* pVtxBuff; //���_�o�b�t�@�̃|�C���^

		//���_���̎擾
	nNumVtx = m_ModelInfo->pMesh->GetNumVertices();
	//���_�t�H�[�}�b�g�̃T�C�Y���擾
	sizeFVF = D3DXGetFVFVertexSize(m_ModelInfo->pMesh->GetFVF());

	m_minpos = D3DXVECTOR3(100000.0f, 1000000.0f, 1000000.0f); //���f���̍ŏ��ʒu
	m_maxpos = D3DXVECTOR3(-100000.0f, -1000000.0f, -100000.0f); //���f���̍ő�ʒu

	//���_�o�b�t�@�̃��b�N
	m_ModelInfo->pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**)&pVtxBuff);
	for (int nCntVtx = 0; nCntVtx < nNumVtx; nCntVtx++)
	{
		//���_���W�̑��
		D3DXVECTOR3 vtx = *(D3DXVECTOR3*)pVtxBuff;

		//x���W�̍ő�l�ŏ��l�`�F�b�N
		if (vtx.x > m_maxpos.x)
		{
			m_maxpos.x = vtx.x;
		}
		if (vtx.x < m_minpos.x)
		{
			m_minpos.x = vtx.x;
		}

		//y���W�̍ő�l�ŏ��l�`�F�b�N
		if (vtx.y > m_maxpos.y)
		{
			m_maxpos.y = vtx.y;
		}
		if (vtx.y < m_minpos.y)
		{
			m_minpos.y = vtx.y;
		}

		//z���W�̍ő�l�ŏ��l�`�F�b�N
		if (vtx.z > m_maxpos.z)
		{
			m_maxpos.z = vtx.z;
		}
		if (vtx.z < m_minpos.z)
		{
			m_minpos.z = vtx.z;
		}

		// ���̒��_�ɐi��
		pVtxBuff += sizeFVF;
	}

	m_ModelInfo->pMesh->UnlockVertexBuffer();
}

//=============================================
//���f���o�^
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

			//X�t�@�C���̓ǂݍ���
			D3DXLoadMeshFromX(pModel,
				D3DXMESH_SYSTEMMEM,
				pDevice,
				NULL,
				&m_ModelInfo[nCnt].pBuffMat,
				NULL,
				&m_ModelInfo[nCnt].dwNumMat,
				&m_ModelInfo[nCnt].pMesh);

			//�����̃t�@�C���p�X��ۑ�
			m_ModelInfo[nCnt].ModelName = pModel;
			nIdx = nCnt;	//�ԍ��̕ۑ�
			m_nNumAll++;	//�����̃J�E���g�A�b�v
			break;
		}
		else if (m_ModelInfo[nCnt].ModelName == pModel)
		{//�����̃��f�������݂���Ȃ�

			//�ԍ���������break
			nIdx = nCnt;
			break;
		}
	}
	return nIdx;
}

//=============================================
//����
//=============================================
CModel_Parts* CModel_Parts::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot,char* pModel)
{
	CModel_Parts*pModelParts = new CModel_Parts;

	if (pModelParts == nullptr)
	{
		return nullptr;
	}

	pModelParts->m_pos = pos; //���_���
	pModelParts->m_rot = rot; //���_���

	//X�t�@�C���ǂݍ���
	pModelParts->BindXFile(pModelParts->GetModelInfo(pModelParts->Regist(pModel)).pBuffMat, //�}�e���A���擾
		pModelParts->GetModelInfo(pModelParts->Regist(pModel)).dwNumMat, //�}�e���A�����擾
		pModelParts->GetModelInfo(pModelParts->Regist(pModel)).pMesh); //���b�V�����擾

	return pModelParts;
}

//=============================================
//�e�p�[�c�̐ݒ�
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

