# flutter-todolist

### 간단한 CRUD 처리를 위한 API 서버 구현
- SpringBoot
- JPA
- H2 내장 데이터베이스 사용

### flutter에서 사용한 라이브러리
- GetX (상태관리)
- validators

### API 문서
```json
1. 공통코드
statusCode : 1 통신 정상
statusCode : -1 통신 실패

2. 작업 추가
요청 주소 (POST)
- http://localhost:8080/todo

요청 파라미터
- application/json
{
    "title":"오늘할일3",
    "content":"메모3"
}

응답 바디
- application/json
{
    "statusCode": 1,
    "msg": "저장 성공",
    "data": {
        "id": 7,
        "title": "오늘할일3",
        "content": "메모3",
        "completed": false
    }
}

3. 작업 리스트
요청 주소 (GET)
- http://localhost:8080/todo

응답 바디
- application/json
{
    "statusCode": 1,
    "msg": "전체목록 성공",
    "data": [
        {
            "id": 5,
            "title": "저녁 식사 재료 사오기",
            "content": "1. 돼지고기 \n2. 간장\n3. 양파\n4. 대파",
            "completed": false
        },
        {
            "id": 6,
            "title": "개발 공부하기",
            "content": "플러터공부\n리액트공부",
            "completed": true
        },
        {
            "id": 7,
            "title": "오늘할일3",
            "content": "메모3",
            "completed": false
        }
    ]
}

4. 작업 상세보기
요청 주소 (GET)
- http://localhost:8080/todo/5

응답 바디
- application/json
{
    "statusCode": 1,
    "msg": "상세보기 성공",
    "data": {
        "id": 5,
        "title": "저녁 식사 재료 사오기",
        "content": "1. 돼지고기 \n2. 간장\n3. 양파\n4. 대파",
        "completed": false
    }
}

5. 작업 수정하기
요청 주소 (PUT)
- http://localhost:8080/todo/5

요청 파라미터
- application/json
{
    "title":"할일수정",
    "content":"메모수정"
}

응답 바디
- application/json
{
    "statusCode": 1,
    "msg": "수정 성공",
    "data": {
        "id": 5,
        "title": "할일수정",
        "content": "메모수정",
        "completed": false
    }
}

6. 작업 삭제하기
요청 주소 (DELETE)
- http://localhost:8080/todo/5

응답 바디
- application/json
{
    "statusCode": 1,
    "msg": "삭제 성공",
    "data": null
}
```

![녹화_2021_09_28_14_14_03_715](https://user-images.githubusercontent.com/74044232/135027570-25549148-354d-4cdd-88be-7b6d2106786a.gif)
