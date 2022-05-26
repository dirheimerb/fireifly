import Express from 'express'
import express from 'express'

const router = Express.Router()

const app = express()

app.post('/task/new', async (req, res) => {
    await addNewTask(req.body.task)
     res.status(200).send();
})
app.post('/task/update',async (req,res)=>{
    let db = await connectDB();
    await updateTask(req.body.task);
    res.status(200).send();
});

app.post('/comment/new',async (req,res)=>{
    let comment = req.body.comment;
    let db = await connectDB();
    let collection = db.collection(`comments`);
    await collection.insertOne(comment);
    res.status(200).send();
});