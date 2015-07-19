Generation.create(name: '20代', value: 20)
Generation.create(name: '30代', value: 20)

Gender.create(name: '男')
Gender.create(name: '女')

UserType.create(generation_id: 1, gender_id:1)
UserType.create(generation_id: 2, gender_id:1)
UserType.create(generation_id: 1, gender_id:2)

Category.create(name: 'モテ歌', description: 'これで君もモテモテ！', user_type_ids:[1,2,3])
Category.create(name: 'ヤレる歌', description: 'これで君もヤリチン！', user_type_ids:[1])

Artist.create(name: 'Mr.Children')
Artist.create(name: 'ゆず')

Song.create(title: 'Over', artist_id: 1, category_ids:[1])
Song.create(title: '星になれたらいいな', artist_id: 1, category_ids:[1,2])
Song.create(title: '口笛', artist_id: 1, category_ids:[2])
Song.create(title: '強がり', artist_id: 1,category_ids:[2])
Song.create(title: 'Sign', artist_id: 1,category_ids:[1,2])
Song.create(title: '夏色', artist_id: 2,category_ids:[1,2])
Song.create(title: 'サヨナラバス', artist_id: 2,category_ids:[2])
Song.create(title: '超特急', artist_id: 2,category_ids:[1])

Score.create(song_id:1, category_id:1)
Score.create(song_id:3, category_id:1)
Score.create(song_id:3, category_id:1)
Score.create(song_id:3, category_id:1)
Score.create(song_id:2, category_id:2)
Score.create(song_id:2, category_id:2)
Score.create(song_id:2, category_id:2)
Score.create(song_id:8, category_id:1)
Score.create(song_id:8, category_id:1)
Score.create(song_id:8, category_id:1)
Score.create(song_id:8, category_id:1)




