require 'spec_helper'
require_relative '../fence_cipher'

RSpec.describe 'fence cipher' do
  describe '.encode' do
    context 'when passed a string smaller than the number lines' do
      it 'returns a blank string' do
          encrypted_text = FenceCipher.encode("", 3)
          expect(encrypted_text).to eq ''
      end
    end
    context '.make_split_strings' do
      context 'when passed 3, and a string' do
        it 'returns 3 number of strings' do
          line1, line2, line3= FenceCipher.make_split_strings("WE ARE D", 3)
          expect(line1).to eq 'WE'
          expect(line2).to eq 'ERD'
          expect(line3).to eq 'A'
        end
      end
    end
    context 'with a full example' do
      it 'has a method encode that takes a string' do
         encrypted_text = FenceCipher.encode("WE ARE DISCOVERED FLEE AT ONCE", 3)
         expect(encrypted_text).to eq "WECRLTEERDSOEEFEAOCAIVDEN"
      end
    end
  end
end
