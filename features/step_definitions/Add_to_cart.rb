Given("a market") do
  @market=@user.markets.create!({
                :name => "negozio",
                :tipo => "sport",
                :nation => "Italia",
                :city => "Roma"
                })
end

Given("an article") do

    @article=@market.articles.create!({
                :name => "Article",
                :prezzo => 15,
                :status => "true",
                :description => "Hello"
                })
end



