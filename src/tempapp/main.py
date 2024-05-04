from fastapi import FastAPI

app = FastAPI()


@app.get("/health")
async def health():
    """ヘルスチェック用のエンドポイント"""
    return {"message": "ok"}
