class String
  
  def normalize
    delete, ary = [], self.gsub(/\/\.(?=\/)|^\.\//,'').split('/')   # remove single dots
    ary.each_with_index{|item, index| delete.push([index, (delete.last ? (delete.flatten.last-1) : index-1)]) if item.eql?('..') && ary.take(index+1).join.match(/\w+/)}   # search double dots + parents to remove
    ary.reject{|e| delete.flatten.include?(ary.index(e))}.join('/')   # remove and recreate the string
  end
  
end