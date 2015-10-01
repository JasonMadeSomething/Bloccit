include RandomData

50.times { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
posts = Post.all

100.times { Comment.create!(post: posts.sample, body: RandomData.random_paragraph) }
test_post = Post.find_or_create_by(title: "Unique title", body: "Unique body")
Comment.find_or_create_by(post: test_post, body: "A body")
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"