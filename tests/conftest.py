import pytest


@pytest.fixture(scope="module")
def client():
    """Get a FastAPI test client."""
    from fastapi.testclient import TestClient
    from tempapp.main import app

    return TestClient(app)
