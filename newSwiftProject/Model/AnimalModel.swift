

enum AnimalType: String{
    case dog = "🐶"
    case rabbit = "🐰"
    case turtle = "🐢"
    case cat = "🐱"
    
    
    var difinition: String {
        switch self{
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь"
        case .cat:
            return "Вы себе на уме. Вы любите гулять одни. Вы цените одиночество"
        case .rabbit:
            return "Вам нравится всё мягкое. Вы здоровы и полны энергии"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на дальних дистанциях"
        }
    }
    
}
