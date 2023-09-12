require 'test_helper'
class OfferFlowTest < ActionDispatch::IntegrationTest

    def setup
        @one = offer(:first_offer)
        @two = offer(:second_offer)
        @three = offer(:third_offer)
        end
 
        test "offer index" do
            visit offers_path
            assert_content page, "Offers"
            assert_content page, @one.title
            assert_content page, @two.title
            assert_content page, @three.title
           end

           test "offer show" do
            visit offers_path
            click_link "Show #{@one.title}"
            assert_content page, @one.title
            assert_content page, @one.description
           end

           test "custom user flow" do
            # get to root
            visit offers_path
            #enter to three
            click_link "Show #{@three.title}"
            assert_content page, @three.title
            assert_content page, @three.description
            assert_content page, "Destroy this offer"
            assert_content page, "Edit this offer"
            assert_content page, "Back to offer"
            #delete Three
            click_button "Destroy this offer"
            #return to root
            assert_content page, "Offers"
            assert_content page, @one.title
            assert_content page, @two.title
            #enter to two
            click_link "Show #{@two.title}"
            assert_content page, @two.title
            assert_content page, @two.description
            assert_content page, "Destroy this offer"
            assert_content page, "Edit this offer"
            assert_content page, "Back to offers"
            #return to root
            click_link "Back to offers"
            #enter to one
            click_link "Show #{@one.title}"
           end

end