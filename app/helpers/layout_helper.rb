module LayoutHelper

  def single_column(options={}, &block)
    column(merge_kv({:class => 'single_column'}, options), &block)
  end

  def single_center(&block)
    column({:class => 'single_center'}, &block)
  end

  def wide_column(&block)
    column({:class => 'wide_column'}, &block)
  end

  def main_column(options={}, &block)
    column(merge_kv({:class => 'main_column'}, options), &block)
  end

  def sidebar_column(options={}, &block)
    column(merge_kv({:class => 'sidebar'}, options), &block)
  end

  def nav_separator(html = '&#124')
    content_tag(:span, html, :class => 'separator') 
  end


  private

  
  def merge_kv(op1, op2)
    join = op1
    op2.keys.each do |k|
      if op1.has_key?(k)
        join[k] << ' ' << op2[k]
      else
        join[k] = op2[k]
      end
    end
    join
  end

  def column(options={}, &block)
    concat content_tag(:div, capture(&block), options)
  end

end
