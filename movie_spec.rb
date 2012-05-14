require 'spec_helper'

describe Movie do
  describe 'finding similar movies with director name' do
    context 'with movie director given' do
      it 'should return movies with the same director name' do
        first_movie = Movie.create!(:title => "Movie 1", :director => "Director 1")
        second_movie = Movie.create!(:title => "Movie 2", :director => "Director 1")
        
        Movie.should_receive(:where).with(hash_including(:director => first_movie.director))
        
        Movie.find_similar_movies_to(first_movie)
      end
    end
  end
end