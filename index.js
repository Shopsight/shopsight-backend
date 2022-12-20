const express = require("express");
const cors = require("cors");

require("dotenv").config();

const app = express();

const authRouter = require("./routes/auth.route");
const userRouter = require("./routes/user.route");

app.use(cors());
app.use(express.json({ extended: true }));

app.use("/api/auth", authRouter);
app.use("/api/user", userRouter);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});
