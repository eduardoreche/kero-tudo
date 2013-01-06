module HomeHelper
  
  def product_picture_tag(product)
    if product.pictures.size > 0 
      product.pictures[0].picture.url(:thumb)
    else
      'kero-tudo-no-picture.png'
    end
  end
  
end
