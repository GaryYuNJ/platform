package cn.elvea.service.impl;

import cn.elvea.commons.service.jpa.BaseJpaEntityService;
import cn.elvea.domain.Attachment;
import cn.elvea.repository.AttachmentRepository;
import cn.elvea.service.AttachmentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AttachmentServiceImpl extends BaseJpaEntityService<Attachment, Long, AttachmentRepository> implements AttachmentService {
}
