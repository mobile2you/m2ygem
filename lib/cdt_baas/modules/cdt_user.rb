module CdtBaas

  class CdtUser < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def getUsers()
      response = @request.get(@url + USER)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def saveUser(body)
      response = @request.post(@url + USER, body, true)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def updateUser(id, body)
      response = @request.put(@url + USER + id.to_s, body, [{:key => 'Content-Type', :value => 'application/json'}])
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def findUser(id)
      response = @request.get(@url + USER + id.to_s)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def signin(body)
      response = @request.post(@url + USER + LOGIN, body, true)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def deleteUser(id)
      response = @request.delete(@url + USER + id.to_s)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def assignProfile(userId, profileId)
      response = @request.post(@url + USER + userId.to_s + '/' + ASSIGN_PROFILE + profileId.to_s, {}, true)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

    def unassignProfile(userId, profileId)
      response = @request.post(@url + USER + userId.to_s + '/' + UNASSIGN_PROFILE + profileId.to_s, {}, true)
      userResponse = CdtModel.new(response)
      generateResponse(userResponse)
    end

  end

end
