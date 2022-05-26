"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_validator_1 = require("express-validator");
const passport_1 = __importDefault(require("passport"));
const express_1 = __importDefault(require("express"));
const updateArticleValidations = [
    (0, express_validator_1.check)("title", "toast.post.title_empty").not().isEmpty(),
    (0, express_validator_1.check)("content", "toast.post.content_empty").not().isEmpty(),
    (0, express_validator_1.check)("title", "toast.article.title_too_long").isLength({ max: ARTICLE_TITLE_MAX_LENGTH }),
    (0, express_validator_1.check)("content", "toast.article.content_too_short").isLength({ min: ARTICLE_CONTENT_MIN_LENGTH }),
    (0, express_validator_1.check)("content", "toast.article.content_too_long").isLength({ max: ARTICLE_CONTENT_MAX_LENGTH }),
];
const article = express_1.default.Router();
article.route("/create").post(passport_1.default.authenticate("bearer", { session: false }), updateArticleValidations, controllers.create);
article.route("/edit").post(passport_1.default.authenticate("bearer", { session: false }), [
    (0, express_validator_1.check)("author", "toast.user.attack_alert")
        .exists()
        .custom((value, { req }) => value === req.user._id.toString()),
    ...updateArticleValidations
], controllers.update);
article.route("/").get(controllers.read);
article.route("/remove/:id").get(passport_1.default.authenticate("bearer", { session: false }), controllers.remove);
article.route("/rate").get(passport_1.default.authenticate("bearer", { session: false }), [
    (0, express_validator_1.query)("id", "toast.user.attack_alert").not().isEmpty(),
    (0, express_validator_1.query)("rating", "toast.user.attack_alert").isIn(["0", "1"]),
], controllers.like);
exports.default = article;
