require "spec_helper"

describe GlassbreakerMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  describe "#send_welcome_email" do
    it "sends an email to a new Glassbreaker" do
      glassbreaker = create(:glassbreaker)

      email = InactiveMessageMailer.send_welcome_email(glassbreaker)

      expect(email).to deliver_to(glassbreaker.email)
      expect(email).to deliver_from(ENV.fetch("SENDER_EMAIL_ADDRESS"))
      expect(email).to have_subject(/#{glassbreaker.first_name}, you are a glassbreaker now!/)
      expect(email).to have_body_text(/We are so excited to have you!/)
    end
  end
end
