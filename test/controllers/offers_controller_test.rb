require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
 
  def setup
    @offer = Offer.create(title: "Another Offer", description: "Another Offer
   Description")
   end
 
  test "should get index" do
    get offers_index_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
    assert_equal Offer.count, 4

  
  end

  test "should get show" do
    get offers_url(offer(:first_offer))
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
   
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset

  end

  test "should get edit" do
    get edit_offer_url(offer(:first_offer))
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset

  end

  test "should create  offer" do
    assert_difference "Offer.count", 1 do
    offer offers_url, params:
    { offer:{
    title: "Another Offer",
    description: "Another Offer Description"
    }}
    end
    assert_redirected_to offer_url(Offer.last)
    assert_response :found
    assert_equal 302, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
   end

   test "should update a offer" do
    patch offer_url(offer(:first_offer)), params:
    { offer:{
    title: "Updated Offer",
    description: "Updated Offer Description"
    }}
    offer(:first_offer).reload
    assert_redirected_to offer_url(offer(:first_offer))
    assert_response :found
    assert_equal "Updated Offer", offer(:first_offer).title
    assert_equal "Updated Offer Description", offers(:first_offer).description
    assert_equal 302, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
   end


   test "should destroy a offer" do
    assert_difference "Offer.count", -1 do
    delete offer_url(offers(:first_offer))
    end
    assert_redirected_to offers_url
    assert_response :found
    assert_equal 302, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
   end

 
   test "should get show with setup" do
    get offer_url(@offer)
    assert_response :success
    assert_equal 200, response.status
    assert_equal "text/html", response.media_type
    assert_equal "utf-8", response.charset
   end
end
