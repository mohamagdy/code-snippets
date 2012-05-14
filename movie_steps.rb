Given /the following movies exist/ do |movies_table|
  Movie.delete_all
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1).should < page.body.index(e2)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    if uncheck
      step %Q{I uncheck "ratings_#{rating}"}
    else
      step %Q{I check "ratings_#{rating}"}
    end
  end
end

Then /I should see all of the movies$/ do
  all("table#movies tbody tr").count.should == 10
end
