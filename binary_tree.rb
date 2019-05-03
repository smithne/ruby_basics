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
            while i < data.length
                self.add(data[i])
            end

        end

    end

    def add(data)

    end

    def breadth_first_search(value)

    end


    def depth_first_search(value)

    end

    # recursive depth-first search
    def dfs_rec(value)

    end

end