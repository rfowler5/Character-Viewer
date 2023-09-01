import 'package:character_viewer/configs/api_configs.dart';
import 'package:character_viewer/models/character.dart';

Map<String, dynamic> commonCaseNoImage = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName\">OneName AnotherName</a><br>OneName AnotherName rest of description",
  "Text": "OneName AnotherName - OneName AnotherName rest of description"
};
Character commonCaseNoImageExpected = Character(
    description: "OneName AnotherName rest of description",
    image: '$baseImageURL$defaultImageURL',
    name: "OneName AnotherName");

Map<String, dynamic> commonCaseWithImage = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "/i/81de22e2.jpg", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName\">OneName AnotherName</a><br>OneName AnotherName rest of description",
  "Text": "OneName AnotherName - OneName AnotherName rest of description"
};
Character commonCaseWithImageExpected = Character(
    description: "OneName AnotherName rest of description",
    image: '$baseImageURL/i/81de22e2.jpg',
    name: "OneName AnotherName");

Map<String, dynamic> commonCaseHyphens = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "/i/81de22e2.jpg", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName_Something\">OneName-AnotherName Something</a><br>OneName-AnotherName Something rest of description",
  "Text":
      "OneName-AnotherName Something - OneName-AnotherName Something rest of description"
};
Character commonCaseHyphensExpected = Character(
    description: "OneName-AnotherName Something rest of description",
    image: '$baseImageURL/i/81de22e2.jpg',
    name: "OneName-AnotherName Something");

Map<String, dynamic> noDescription = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "/i/81de22e2.jpg", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName\">OneName AnotherName</a>",
  "Text": "OneName AnotherName"
};
Character noDescriptionExpected = Character(
    description: "",
    image: '$baseImageURL/i/81de22e2.jpg',
    name: "OneName AnotherName");

Map<String, dynamic> noName = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "/i/81de22e2.jpg", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName\"></a><br>OneName AnotherName rest of description",
  "Text": "OneName AnotherName rest of description"
};
Character noNameExpected = Character(
    description: "OneName AnotherName rest of description",
    image: '$baseImageURL/i/81de22e2.jpg',
    name: "");

Map<String, dynamic> wrongPlaceHyphens = {
  "FirstURL": "https://duckduckgo.com/OneName_AnotherName",
  "Icon": {"Height": "", "URL": "/i/81de22e2.jpg", "Width": ""},
  "Result":
      "<a href=\"https://duckduckgo.com/OneName_AnotherName_Something\">OneName - AnotherName Something</a><br>OneName - AnotherName Something rest of description",
  "Text":
      "OneName - AnotherName Something - OneName - AnotherName Something rest of description"
};
Character wrongPlaceHyphensExpected = Character(
    description: "OneName - AnotherName Something rest of description",
    image: '$baseImageURL/i/81de22e2.jpg',
    name: "OneName - AnotherName Something");
