require './lib/caesar_cipher.rb'


describe '#shift' do
    it "offsets a character forward" do
        expect(shift('a', 3)).to eql('d')
    end

    it "offsets a character backward" do
        expect(shift('z', -2)).to eql('x')
    end

    it "wraps around the alphabet forward" do
        expect(shift('a', 28)).to eql('c')
    end

    it "wraps around the alphabet backward" do
        expect(shift('a', -27)).to eql('z')
    end
end

describe '#caesar_cipher' do
    it 'works with single words' do
        expect(caesar_cipher('abcd',1)).to eql('bcde')
    end


    it 'works with mixed cases' do
        expect(caesar_cipher('AbCd',1)).to eql('BcDe')
    end

    it 'works with multiple words' do
        expect(caesar_cipher('Yes No',1)).to eql('Zft Op')
    end

    it 'works with punctuation' do
        expect(caesar_cipher('Yes! _No',1)).to eql('Zft! _Op')
    end


end
