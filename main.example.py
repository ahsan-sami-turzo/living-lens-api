from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "root"}


@app.get("/api")
async def root():
    return {"message": "living lens api"}


@app.get("/api/2")
async def root():
    return {"message": "living lens api 2"}
