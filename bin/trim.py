class Trim:
    qual_score = 0
    trim_type = ""

    reads_passed = 0.0
    bases_passed = 0.0

    
    def __init__(self, score, type, reads_passed, bases_passed):
        self.qual_score = score
        self.trim_type = type
        self.reads_passed = reads_passed
        self.bases_passed = bases_passed

    def qual(self):
        return self.qual_score

    def type(self):
        return self.trim_type
    
    def reads(self):
        return self.reads_passed
    
    def bases(self):
        return self.bases_passed

    

    