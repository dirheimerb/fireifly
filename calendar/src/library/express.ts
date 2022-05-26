import express from 'express'
import morgan from 'morgan'
import cors from 'cors'
import 'dotenv/config'

const corsOptions = {
    origin:'http://localhost:3000'
}
const PORT = process.env.PORT || 8080;

const app = express()

app.use(cors(corsOptions))
app.use(express.json())
app.use(express.urlencoded({ extended: true }));


app.get('/', (req,res,next) => {
    res.json({message:'Welcome!'})
})



app.listen(PORT, () => {
    console.log(`App listening on port ${PORT}`)
})

/***
 * IF using MongoDB
 */

/**
 * const db = require('./app/models')
 * const role = db.role
 * db.mongoose
 * .connect(`mongodb://${dbConfig.HOST}:${dbConfig.PORT}/${dbConfig.DB}`, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => {
    console.log("Successfully connect to MongoDB.");
    initial();
  })
  .catch(err => {
    console.error("Connection error", err);
    process.exit();
  });
...
function initial() {
  Role.estimatedDocumentCount((err, count) => {
    if (!err && count === 0) {
      new Role({
        name: "user"
      }).save(err => {
        if (err) {
          console.log("error", err);
        }
        console.log("added 'user' to roles collection");
      });
      new Role({
        name: "moderator"
      }).save(err => {
        if (err) {
          console.log("error", err);
        }
        console.log("added 'moderator' to roles collection");
      });
      new Role({
        name: "admin"
      }).save(err => {
        if (err) {
          console.log("error", err);
        }
        console.log("added 'admin' to roles collection");
      });
    }
  });
}
----------------------------------------------
 */
