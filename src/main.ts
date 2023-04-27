import express, { Application  } from "express";
import userRouter from "./modules/routes/user.routes.js"

class App {
    public app: Application | undefined;
    
    constructor() {
        this.app = express();
    }
}

const PORT = process.env.PORT || 8080;
const app = new App().app;

app?.get('/', (request, response) => {
    response.send('Hello world!');
});

app?.use(express.json());
app?.use('/api', userRouter);

app?.listen(PORT, () => {
    console.log(`server started on port ${PORT}`)
});
