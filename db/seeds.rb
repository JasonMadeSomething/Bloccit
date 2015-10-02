include RandomData

50.times { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
posts = Post.all

100.times { Comment.create!(post: posts.sample, body: RandomData.random_paragraph) }

30.times {Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1000)) }
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"