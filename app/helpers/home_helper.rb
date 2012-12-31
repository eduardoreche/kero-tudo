module HomeHelper
  
  def product_picture_tag(product)
    if(product.pictures.size > 0)
      product.pictures[0].picture.url(:thumb)
    else
      "/assets/img/fproject_4_1.jpg"
    end
  end
  
end
