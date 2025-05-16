<#

#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 
#LO SO CHE QUESTO CODICE È TREMENDO 

.SYNOPSIS
    Given students' names along with the grade that they are in, create a roster for the school.
.DESCRIPTION
    Add a student's name to the roster for a grade
    "Add Jim to grade 2."
    "OK."
    Get a list of all students enrolled in a grade
    "Which students are in grade 2?"
    "We've only got Jim just now."
    Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
    "Who all is enrolled in school right now?"
    "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"
    Note that all our students only have one name. (It's a small town, what do you want?)
.EXAMPLE
    $roster = [Roster]::new()
    $roster.AddStudent(1,'Billy')
    $roster.AddStudent(1,'Josh')
    $roster.AddStudent(2,'Allison')
    $roster.GetRoster()
    $roster.GetRoster(2)

    This will create a new roster and add 3 students to it.
    When no arguments are supplied to the GetRoster method, all students will be returned.
    When a grade number is supplied to the GetRoster method, students from that grade will be returned.
#>

class Student {
    [string] $Name
    [int] $Grade

    Student([string]$name) {
        $this.Name = $name
    }
} 

class Roster {

    [System.Collections.ArrayList] $Name 
    [System.Collections.Hashtable] $Roster 
    
    Roster() {
        $this.Roster = @{}
        $this.Name = @()
    }

    [System.Collections.ArrayList] SortStudents() {
        $out = [System.Collections.ArrayList]::new()
        $sorted_keys = $this.Roster.keys | Sort-Object
        foreach ($grade in $sorted_keys) {
            $out += $this.Roster[$grade]["Name"]
        }
        return $out
    }

    [bool] CanAdd($student) {
        #$sorted_keys = $this.Roster.keys | Sort-Object
        foreach ($grade in $this.Roster.keys) {
            $grade_names = $this.Roster[$grade]["Name"]
            foreach ($name in $grade_names) {
                if ($name -eq $student) {
                    return $false
                }
            }
        }
        return $true
    }

    [bool] AddStudent($grade, $student_name) {
        if ($this.Name.Contains($student_name)) {
            return $false
        }
        if ($this.Roster[$grade] -eq $null) {
            $this.Roster[$grade] = @{}
            $this.Roster[$grade]["Name"] = [System.Collections.ArrayList]::new()
            $this.Roster[$grade]["Name"].Add($student_name) | Out-Null
            $this.Roster[$grade]["Name"].Sort()
            $this.Name.Add($student_name) | Out-Null
            $this.Name = $this.SortStudents()
            return $true
        } else {
            $grade_list = $this.Roster[$grade].Name
            $grade_list.Add($student_name) | Out-Null
            $grade_list.Sort()
            $this.Name.Add($student_name) | Out-Null
            $this.Name = $this.SortStudents()
            return $true
        }
        return $false
    }

    [Roster] GetRoster() {
        if ($this.Name.Count -eq 0) {
            return $null
        }
        return $this
    }

    [System.Collections.Hashtable] GetRoster($grade) {
        return $this.Roster[$grade]
    }
    
}


