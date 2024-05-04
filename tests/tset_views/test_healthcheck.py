from fastapi.testclient import TestClient

STATUS_OK = 200


def test_healthcheck(client: TestClient):
    """ヘルスチェックのテスト"""
    response = client.get("/health")
    assert response.status_code == STATUS_OK
    assert response.json() == {"message": "ok"}
