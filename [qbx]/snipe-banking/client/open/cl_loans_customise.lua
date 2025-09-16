function CanCreateLoans()
    return Config.LoanJobs[PlayerInfo.job] and Config.LoanJobs[PlayerInfo.job] <= PlayerInfo.jobGrade
end