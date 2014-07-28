( 1..50 ).to_a.each do |i|
  Book.create title: "Lemons VOL: #{i}", author: "King Luther #{i}"
end