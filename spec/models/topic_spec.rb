require 'rails_helper'

describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create # default is public
       @private_topic = Topic.create(public: false)
     end
 
     describe "public" do
       it "returns a relation of all public topics" do
         expect(Topic.public).to eq([@public_topic])
       end
     end
 
     describe "private" do
       it "returns a relation of all private topics" do
        expect(Topic.private).to eq([@private_topic])
       end
     end
 
     describe "visible_to(user)" do
       it "returns all specs if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         expect(Topic.visible_to(user)).to eq([@public_topic, @private_topic])
       end
 
       it "returns only public specs if user is nil" do
        expect(Topic.visible_to(nil)).to eq([@public_topic])
       end
     end
   end
 end