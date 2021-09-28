Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "30자 초과하여 입력할 수 없습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.length > 400) {
      return "400자를 초과할 수 없습니다.";
    } else {
      return null;
    }
  };
}
