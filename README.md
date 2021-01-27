# README
# README

### ユーザー管理機能情報(user)
|        Column        |   Type  |         Options                      |
| -------------------- | ------- | ------------------------------------ |
| nickname             | string  | null: false                          |
| email                | string  | null: false                          |
| encrypted_password   | string  | null: false,default: ""              |
| first_name           | string  | null: false                          |
| last_name            | string  | null: false                          |
| first_name_kana      | string  | null: false                          |
| last_name_kana       | string  | null: false                          |
| birthday             | date    | null: false                          |

# Association
has_many: room_user
has_many: rooms,through:room_user
has_many: memos


###　中間テーブル機能情報(room_user)
| Column |   Type    |            Options           |
| ------ | --------- | ---------------------------- |
| user   | reference | null:false,foreign_key: true |
| room   | reference | null:false,foreign_key: true |

# Association
belongs_to: user
belongs_to: room


### ルーム情報(room)
|     Column      |    Type   |            Options           |
| --------------- | --------- | ---------------------------- |
| context         | string    | null: false                  |

# Association
has_many: room_user
has_many: users,through:room_user
has_many: memos


###　メモ情報(memo)
|     Column      |    Type   |            Options           |
| --------------- | --------- | ---------------------------- |
| context         | string    | null: false                  |
| user            | reference | foreign_key: true            |
| room            | reference | null:false,foreign_key: true |

# Association
belongs_to: user
belongs_to: room
has_one_attached: image


###　スケジュール情報(schedule)
|     Column      |   Type    |      Options      |
| --------------- | --------- | ----------------- |
| day             | string    | null: false       |
| hour            | integer   | null: false       |
| mitites 　　     | string    | null: false       |
| title           | string    | null: false       |
| text            | string    |                   |

# Association
belongs_to: user