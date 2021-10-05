require 'birthday_calculator'

describe BirthdayCalculator do
  let(:subject) { BirthdayCalculator }
  describe '#days_until_birthday' do
    it 'returns 0 if it is your birthday' do
      day = 5
      month = 10
      expect(subject.days_until_birthday(day, month)).to eq 0
    end

    it 'returns 1 if it is your birthday tomorrow' do
      day = 6
      month = 10
      expect(subject.days_until_birthday(day, month)).to eq 1
    end

    it 'returns 61 if it is your birthday in 2 months (flakey)' do
      day = 5
      month = 12
      expect(subject.days_until_birthday(day, month)).to eq 61
    end

    it 'returns 364 if it was your birthday yesterday' do
      day = 4
      month = 10
      expect(subject.days_until_birthday(day, month)).to eq 364
    end

    it 'returns the right number if it rolls over to next year' do
      day = 1
      month = 1
      expect(subject.days_until_birthday(day, month)).to eq 88
    end

    it 'throws an error if the day is too big' do
      day = 32
      month = 10
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end

    it 'throws an error if the month is too big' do
      day = 5
      month = 13
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end

    it 'throws an error if the day is not a positive integer' do
      day = -5
      month = 13
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end

    it 'throws an error if the day is 0' do
      day = 0
      month = 13
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end

    it 'throws an error if the month is not a positive integer' do
      day = 5
      month = -5
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end

    it 'throws an error if the month is 0' do
      day = 5
      month = 0
      expect{ subject.days_until_birthday(day, month) }.to raise_error(Date::Error)
    end
  end

end
