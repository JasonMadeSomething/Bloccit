include RandomData

15.times { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
topics = Topic.all

50.times { Post.create!(topic: topics.sample, title: RandomData.random_sentence, body: RandomData.random_paragraph) }
posts = Post.all

100.times { Comment.create!(post: posts.sample, body: RandomData.random_paragraph) }

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"