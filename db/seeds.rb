3.times do |n|
  Note.create content: "Content of note #{n}", done: n % 2 == 0
end