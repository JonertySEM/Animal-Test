

struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question{
    static func getQuestion() -> [Question]{
        return [
            Question(
                text: "Какую пищу вы предпочитаете?",
                type: .singeType,
                answers: [
                    Answer(text: "Стейк", typeAnimal: .dog),
                    Answer(text: "Рыба", typeAnimal: .cat),
                    Answer(text: "Морковь", typeAnimal: .rabbit),
                    Answer(text: "Кукуруза", typeAnimal: .turtle)
                ]),
            Question(
                text: "Что вам нравится больше?",
                type: .multiplyType,
                answers: [
                    Answer(text: "Плавать", typeAnimal: .dog),
                    Answer(text: "Спать", typeAnimal: .cat),
                    Answer(text: "Обниматься", typeAnimal: .rabbit),
                    Answer(text: "Есть", typeAnimal: .turtle)
                ]),
            Question(
                text: "Любите ли вы поездки?",
                type: .rangeType,
                answers: [
                    Answer(text: "Ненавижу", typeAnimal: .dog),
                    Answer(text: "Нервничаю", typeAnimal: .cat),
                    Answer(text: "Не замечаю", typeAnimal: .rabbit),
                    Answer(text: "Обожаю", typeAnimal: .turtle)
                ])
        
        ]
    }
}
