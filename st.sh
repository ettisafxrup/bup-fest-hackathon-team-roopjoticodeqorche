python3 -m venv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

pip install uvicorn
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000