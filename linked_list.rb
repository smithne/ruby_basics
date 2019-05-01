class LinkedList

    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        new_node = Node.new(value, nil)
        if @tail
            @tail.next_node = new_node
        else #first node
            @head = new_node
        end
        @tail = new_node
        @size += 1
    end

    def prepend(value)
        new_node = Node.new(value, nil)
        new_node.next_node = @head
        @tail = new_node unless @tail #first node, so tail not yet defined
        @head = new_node
        @size += 1
    end

    def at(index)

        return "Error: index exceeds size of list" if index >= @size
        
        count = 0
        node = @head
        while count < index do
            node = node.next_node
            count += 1
        end
        
        return node
    end
end


class Node

    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end

list = LinkedList.new()
