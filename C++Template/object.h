//=============================================
//
//3DTemplate[object.h]
//Auther Matsuda Towa
//
//=============================================
#ifndef _OBJECT_H_ //これが定義されてないとき

#define _OBJECT_H_
#include "main.h"

//オブジェクトクラス
class CObject
{
public:
	static const int MAX_OBJECT = 256; //オブジェクトの最大数

	typedef enum
	{
		OBJECT_TYPE_NONE = 0,
		OBJECT_TYPE_TITLE,
		OBJECT_TYPE_TUTORIAL,
		OBJECT_TYPE_RESULT,
		OBJECT_TYPE_FADE,
		OBJECT_TYPE_NUMBER,
		OBJECT_TYPE_PLAYER,
		OBJECT_TYPE_BLOCK,
		OBJECT_TYPE_FIELD,
		OBJECT_TYPE_EFFECT,
		OBJECT_TYPE_BG,
		OBJECT_TYPE_MAX,
	}OBJECT_TYPE;

	CObject(int nPriority = MAX_PRIORITY);

	virtual ~CObject();
	virtual HRESULT Init() = 0;
	virtual void Uninit() = 0;
	virtual void Update() = 0;
	virtual void Draw() = 0;

	static void ReleaseAll(); //全オブジェクト解放

	static void UpdateAll(); //全オブジェクト更新

	static void DrawAll(); //全オブジェクト描画

	static CObject* Getobject(int nPri,int nIdx);

	OBJECT_TYPE GetType();

	void SetType(OBJECT_TYPE type);

	OBJECT_TYPE m_type;
	
protected:
	void Release(); //自分自身の解放

private:
	static CObject* m_apObject[MAX_PRIORITY][MAX_OBJECT];

	int m_nPriority; //描画優先度

	static int m_nNumAll; //総数

	int m_nID; //オブジェクトのID
};
#endif