"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const express_2 = __importDefault(require("express"));
const router = express_1.default.Router();
const app = (0, express_2.default)();
app.post('/task/new', async (req, res) => {
    await addNewTask(req.body.task);
    res.status(200).send();
});
app.post('/task/update', async (req, res) => {
    let db = await connectDB();
    await updateTask(req.body.task);
    res.status(200).send();
});
app.post('/comment/new', async (req, res) => {
    let comment = req.body.comment;
    let db = await connectDB();
    let collection = db.collection(`comments`);
    await collection.insertOne(comment);
    res.status(200).send();
});
