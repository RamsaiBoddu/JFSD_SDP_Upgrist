package com.example.demo.service;

import java.util.List;


import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.CourseMapping;
import com.example.model.User;
import com.example.repository.CourseMappingRepository;

@Service
public class CourseMappingManager {

    @Autowired
    private CourseMappingRepository courseMappingRepository;

    public void processExcelFile(MultipartFile file) throws Exception {
        // Use Apache POI to read the Excel file
        Workbook workbook = WorkbookFactory.create(file.getInputStream());
        Sheet sheet = workbook.getSheetAt(0);

        for (Row row : sheet) {
            // Skip the header row
            if (row.getRowNum() == 0) continue;

            // Map Excel rows to entity
            CourseMapping courseMapping = new CourseMapping();

            // Check and set values for each column, ensuring we handle nulls or invalid data gracefully
            if (row.getCell(0) != null) {
                courseMapping.setCourseId((int) row.getCell(0).getNumericCellValue());
            }

            if (row.getCell(1) != null) {
                courseMapping.setCourseName(row.getCell(1).getStringCellValue());
            }

            if (row.getCell(2) != null) {
                courseMapping.setStudentId((int) row.getCell(2).getNumericCellValue());
            }

            if (row.getCell(3) != null) {
                courseMapping.setMarks((int) row.getCell(3).getNumericCellValue());
            }

            if (row.getCell(4) != null) {
                courseMapping.setAttendance((int) row.getCell(4).getNumericCellValue());
            }

            // Save to database
            courseMappingRepository.save(courseMapping);
        }
        workbook.close();
    }
    
   // public List<CourseMapping> findCourseMappingsByStudentId(int studentId) {
       // return courseMappingRepository.findByStudentId(studentId);
   // }
    public List<CourseMapping> getAllCourseMappings() {
        return courseMappingRepository.findAll();
    }

    public List<CourseMapping> getCourseMappingsByStudentId(int studentId) {
        return courseMappingRepository.findByStudentId(studentId);
    }


    
}
