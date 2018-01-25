require "docking_station"

describe DockingStation do
  # Expecting that DockingStation class responds to release_bike method
  # Create a new variable bike = subject(instatiation of DockingStation class).release_bike
  # Expecting object bike to works, when calling method working? should returns true
  it { is_expected.to respond_to :bike }
  
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    # it "Bike should be a working bike" do
    #   bike = Bike.new
    #   expect(bike).to be_working
    # end

    it "releases a bike from the bike bike_rack" do
      10.times{subject.dock Bike.new}
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    it "raises error when no bike is in the docking station" do
      expect{subject.release_bike}.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument}

    it "can store a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it "raises an error when trying to dock a bike when twenty bikes are already docked" do
      expect{ 21.times{ subject.dock(Bike.new) } }.to raise_error("Dock is full")
    end
  end

    it 'Should return bike if available' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

  describe '#initialize' do
    it "should have a capacity of 20 bikes" do
    expect{ 20.times{ subject.dock Bike.new }}.to_not raise_error
    end

  end
end
