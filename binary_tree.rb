class Node

    attr_accessor :value, :parent, :left, :right

    def initialize(value = nil, parent = nil, left = nil, right = nil)
        @value = value
        @parent = parent
        @left = left
        @right = right
    end

end

class Tree
    attr_accessor :root

    def initialize(data = nil)
        if data
            build_tree(data)
        else
            @root = nil
        end
    end


    def build_tree(data)
        if data.length == 0
            @root = nil
        else
            @root = Node.new(data[0], nil, nil, nil)
            i = 1

            ## to do - finish build methodology
            node = @root
            
            while i < data.length
                add_node(data[i], @root)
                i += 1
                puts data[i]
            end
        end
    end

    def add_node(data, parent)
        if data < parent.value
            if parent.left == nil
                parent.left = Node.new(data, parent, nil, nil)
            else
                add_node(data, parent.left)
            end
        else
            if parent.right == nil
                parent.right = Node.new(data, parent, nil, nil)
            else
                add_node(data, parent.right)
            end
        end
    end

    def breadth_first_search(search_value)
        return "Tree is null" if @root.nil?
        queue = [@root]
        node = @root
        while (!queue.empty?)
            node = queue.shift
            return node if node.value == search_value
            queue << node.left if node.left
            queue << node.right if node.right
            #puts node.value
        end
        return nil
    end


    def depth_first_search(search_value = nil)
        return "Tree is null" if @root.nil?
    end

    # recursive depth-first search
    def dfs_rec(search_value = nil)
        return "Tree is null" if @root.nil?
    end

end

# debug stuff
tree = Tree.new()
array = [12, 3, 72, 34, 4, 9, 18, 54, 23, 38, 22, 1, 5, 99]
tree.build_tree(array)
