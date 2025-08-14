from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
import requests
from database import engine, get_db
from models import Base, User

Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.get("/")
def root():
    return {"message": "User API is running"}

@app.get("/get_users")
def get_users(db: Session = Depends(get_db)):
    users = db.query(User).all()
    return {"users": [{"id": u.id, "name": u.name, "email": u.email} for u in users]}

@app.post("/add_user")
def add_user(db: Session = Depends(get_db)):
    r = requests.get("https://randomuser.me/api/").json()
    user_info = r["results"][0]
    name = f"{user_info['name']['first']} {user_info['name']['last']}"
    email = user_info['email']
    
    existing_user = db.query(User).filter(User.email == email).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="User with this email already exists")
    
    new_user = User(name=name, email=email)
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    
    return {"message": "User added", "name": new_user.name, "email": new_user.email}