from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "root"}

@app.get("/api")
async def root():
    return {"message": "living lens api"}