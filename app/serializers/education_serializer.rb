class EducationSerializer < ActiveModel::Serializer
  attributes :institution, :certificate, :certificate_proof, :year_from, :year_to
end
