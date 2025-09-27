import sys, os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import app
def test_home():
    client = app.app.test_client()
    res = client.get('/')
    assert res.status_code == 200
    assert b"Hello DevOps CI/CD Demo V2!" in res.data
