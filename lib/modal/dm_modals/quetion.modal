
class Quemodal {
    String? id;
    String? catId;
    String? question;
    String? option1;
    String? option2;
    String? option3;
    String? option4;
    String? answer;

    Quemodal({this.id, this.catId, this.question, this.option1, this.option2, this.option3, this.option4, this.answer});

    Quemodal.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        catId = json["cat_id"];
        question = json["question"];
        option1 = json["option1"];
        option2 = json["option2"];
        option3 = json["option3"];
        option4 = json["option4"];
        answer = json["answer"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["cat_id"] = catId;
        _data["question"] = question;
        _data["option1"] = option1;
        _data["option2"] = option2;
        _data["option3"] = option3;
        _data["option4"] = option4;
        _data["answer"] = answer;
        return _data;
    }
}